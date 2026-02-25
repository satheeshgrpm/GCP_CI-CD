
const express = require("express");
const app = express();
app.use(express.json());

const ENV = process.env.ENV || "dev";
const BRAND = process.env.BRAND || "generic";

app.get("/health",(req,res)=>res.send("OK"));

app.post("/chat",(req,res)=>{
  res.json({ response: `[${ENV}][${BRAND}] ${req.body.prompt}` });
});

app.listen(8080,()=>console.log("running"));
