import express, { Request, Response } from 'express'
import {json} from 'body-parser'
import authRouter from './routes/auth_routes'
import conversationsRouter from './routes/conversations_routes'
 

const app = express()
app.use(json())
const PORT = 5000

app.use('/auth', authRouter)
app.use('/conversations', conversationsRouter)

app.listen(PORT,'0.0.0.0',()=>{
    console.log("Server is running on PORT",PORT)
})