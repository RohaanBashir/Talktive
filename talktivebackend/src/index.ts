import express, { Request, Response } from 'express'
import {json} from 'body-parser'
import authRouter from './routes/auth_routes'
import conversationsRouter from './routes/conversations_routes'
import messagesRouter from './routes/message_routes'
import {Server} from 'socket.io'
import http from 'http'
import { saveMessage } from './controller/messageControleler'
 

const app = express()
const server = http.createServer(app)
app.use(json())
const io = new Server(server,{
    cors:{
        origin : '*'
    }
})
const PORT = 5000

app.use('/auth', authRouter)
app.use('/conversations', conversationsRouter)
app.use('/messages', messagesRouter)


io.on('connection', (socket)=>{
    console.log("new user connected")
    socket.on('joinConversation' , (conversationId)=>{
        socket.join(conversationId)
        console.log("user joined conversation: " +conversationId)
    })
    socket.on('sendMessage', async (message)=>{
        const {conversationId, senderId, content} = message
        try{
            const savedMessage = await saveMessage(conversationId,senderId,content)
            console.log(savedMessage)
            io.to(conversationId).emit('newMessage',savedMessage)
        }catch(err){
            console.error("Failed to save message:")
        }
    })
    socket.on('disconnect', ()=>{
        console.log('User disconnected', socket.id)
    })
})


server.listen(PORT,'0.0.0.0',()=>{
    console.log("Server is running on PORT",PORT)
})