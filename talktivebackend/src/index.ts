import express, { Request, Response } from 'express'
import {json} from 'body-parser'
import authRouter from './routes/auth_routes';


const app = express()
app.use(json())
const PORT = 6000

app.use('/auth', authRouter)

app.listen(PORT,()=>{
    console.log("Server is running on PORT",PORT)
})