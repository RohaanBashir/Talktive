import { Router } from "express";
import { fetchAllMessagesByConversationId } from "../controller/messageControleler";
import {verifyToken} from '../middlewears/authMiddlewear'


const router = Router()

router.get('/:conversationId',verifyToken,fetchAllMessagesByConversationId)
export default router