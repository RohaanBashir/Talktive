

import { Router, Response, Request } from 'express'
import pool from "../models/db";


export const fetchAllConversations = async (req: Request, res: Response) => {
    let userId = null;

    if (req.user) {
        userId = req.user.id
    }

    try {
        const result = await pool.query(
            `
            SELECT 
        c.id AS conversation_id,
        u.username AS participant_name,
        m.content AS last_message, 
        m.created_at AS last_message_time 
        FROM conversations c 
        JOIN users u 
        ON u.uid = CASE 
      WHEN c.participant_one = $1 THEN c.participant_two 
      ELSE c.participant_one 
        END
        LEFT JOIN LATERAL (
        SELECT content, created_at 
        FROM messages 
        WHERE conversation_id = c.id 
        ORDER BY created_at DESC 
        LIMIT 1
        ) m ON true
        WHERE c.participant_one = $1 OR c.participant_two = $1
        ORDER BY m.created_at DESC;
        `  , [userId])
        res.status(200).json(result.rows)

    } catch (e) {
        res.status(500).json({ error: e })
    }
}