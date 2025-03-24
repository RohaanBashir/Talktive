import { Request, Response } from "express";
import bcrypt from "bcrypt";
import pool from "../models/db";
import jwt from "jsonwebtoken"

export const register = async (req: Request, res: Response): Promise<any> => {

  try {
    const { username, email, password } = req.body;

    // Hash the password
    const hashedPass = await bcrypt.hash(password, 10); 

    // Insert the user into the database
    const result = await pool.query(
      "INSERT INTO users (username, email, password) VALUES ($1, $2, $3) RETURNING *",
      [username, email, hashedPass]
    );

    const user = result.rows[0]; // Get the inserted user

    res.status(201).json({ message: "User registered successfully", user });
  } catch (e) {
    console.error("Error during registration:", e);
    res.status(500).json({ message: "User registration unsuccessful", error: e });
  }
};

export const login = async (req: Request, res: Response): Promise<any> => {
    try {
      const { email, password } = req.body;
  
      // Find the user by email
      const result = await pool.query("SELECT * FROM users WHERE email = $1", [email]);
      const user = result.rows[0];
  
      // If user not found
      if (!user) {
        return res.status(404).json({ message: "User not found" }); // Use return to stop execution
      }
  
      // Compare the provided password with the hashed password
      const isMatch = await bcrypt.compare(password, user.password); // Await the comparison
      if (!isMatch) {
        return res.status(400).json({ message: "Invalid credentials" }); // Use return to stop execution
      }
      
      // Generate a JWT token
      const token = jwt.sign({id: user.uid}, "mysecret", { expiresIn: "10h" });
  
      // Send the token and user data in the response
      res.json({ message: "Login successful", token, user});
    } catch (e) {
      console.error("Error during login:", e);
      res.status(500).json({ message: "User login unsuccessful", error: e instanceof Error ? e.message : "Unknown error" });
    }
  };