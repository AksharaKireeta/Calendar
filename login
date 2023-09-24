import React,{ useState } from 'react';
import { useNavigate,Navigate } from 'react-router';
import styles from './LoginForm.module.css';
import axios from 'axios';




const Login=()=>{
const navigate=useNavigate()
const [username,setUserName]=useState('');
const [status,setStatus]=useState('')
const [password,setPassword]=useState('');
//const navigate=useNavigate();




const handleUsernameChange=(event)=>{
setUserName(event.target.value);





};
let status1="";
const handlePasswordChange=(event)=>{
setPassword(event.target.value);
};


async function authenticateUser(){


const requestData={
username, password
};




await axios.post('http://localhost:8082/login',requestData)
.then((response)=>{
// setStatus(response.data)
status1=response.data;
console.log("result")
console.log(response.data)
})


.catch((error)=>{
console.error('Error:',error);
});



if(status1=="success")
{


setStatus("fail");
navigate('/team')
}
else{
console.log("checking")
console.log(status1)


}
};
const handleLogin=()=>{




// console.log('handlelogin called');
authenticateUser();


};
return(
<div className='bg'>
<div className={styles['login-container']}>
<div className={styles['login-box']}>
<h2> Welcome to ADP</h2>


<label htmlFor='username' className={styles['left-label']}>Username
<input type="text" className={styles['input-group']}
id="username"
placeholder="Enter your username"
value={username}
onChange={handleUsernameChange}
/>
</label>
<label htmlFor='password' className={styles['left-label']}>Password</label>
<input type="password"
id="password"
placeholder="Enter your password"
value={password}
onChange={handlePasswordChange}
/>
<button onClick={handleLogin}> Login</button>
</div>
</div>
</div>


);
};
export default Login;
