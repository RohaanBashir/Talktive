import { Request,Response,NextFunction } from "express"
import jwt from 'jsonwebtoken'

export const verifyToken = (req: Request, res:Response, next: NextFunction) => {

    const token = req.headers.authorization?.split(' ')[1]
    if(!token){
        res.status(403).json({error: "No token provided"})
        return
    }

    try{
        const decoded = jwt.verify(token,"mysecret")
        console.log(decoded)
        req.user = decoded as {id:string}
        next()

    }catch{
    res.status(401).json({error:"Error"})
    }

}
export default verifyToken