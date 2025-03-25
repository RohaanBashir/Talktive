
import { Router, Response, Request } from 'express'
import pool from "../models/db";
import verifyToken from "../middlewears/authMiddlewear"
import { fetchAllConversations } from '../controller/conversationController';

const router = Router()

router.get('/', verifyToken,fetchAllConversations)
export default router