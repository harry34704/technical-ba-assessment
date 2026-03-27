from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, EmailStr
from typing import Optional

app = FastAPI(
    title="User Management API",
    description="A simple FastAPI-based User Management API for Technical Business Analyst assessment.",
    version="1.0.0"
)

# In-memory storage
users_db = {}
next_user_id = 101


# Request models
class UserCreate(BaseModel):
    name: str
    email: EmailStr


class UserUpdate(BaseModel):
    name: Optional[str] = None
    email: Optional[EmailStr] = None


# Response model
class UserResponse(BaseModel):
    id: int
    name: str
    email: EmailStr


@app.get("/health")
def health_check():
    return {"status": "ok"}


@app.post("/api/v1/users", response_model=UserResponse, status_code=201)
def create_user(user: UserCreate):
    global next_user_id

    # Check for duplicate email
    for existing_user in users_db.values():
        if existing_user["email"].lower() == user.email.lower():
            raise HTTPException(status_code=409, detail="Email already in use")

    new_user = {
        "id": next_user_id,
        "name": user.name,
        "email": user.email
    }

    users_db[next_user_id] = new_user
    next_user_id += 1

    return new_user


@app.get("/api/v1/users/{user_id}", response_model=UserResponse)
def get_user(user_id: int):
    user = users_db.get(user_id)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    return user


@app.put("/api/v1/users/{user_id}", response_model=UserResponse)
def update_user(user_id: int, user_update: UserUpdate):
    user = users_db.get(user_id)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")

    # Check duplicate email if email is being updated
    if user_update.email:
        for existing_id, existing_user in users_db.items():
            if (
                existing_id != user_id
                and existing_user["email"].lower() == user_update.email.lower()
            ):
                raise HTTPException(status_code=409, detail="Email already in use")

    if user_update.name is not None:
        user["name"] = user_update.name

    if user_update.email is not None:
        user["email"] = user_update.email

    users_db[user_id] = user
    return user


@app.delete("/api/v1/users/{user_id}")
def delete_user(user_id: int):
    if user_id not in users_db:
        raise HTTPException(status_code=404, detail="User not found")

    del users_db[user_id]
    return {"message": f"User {user_id} deleted successfully"}
