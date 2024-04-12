<!-- 
    v-model: 
    ========
    - Create a two-way binding on a form input element or a component. input -> comp. data  &  comp. data -> input
-->

<template>
    <form @submit.prevent="handleSubmit">
        <!-- Full Name -->
        <label for="fName">Full Name</label>
        <input type="fname" required name="fName" v-model="fName">

        <!-- Email -->
        <label for="email">Email</label>
        <input type="email" required name="email" v-model="email">

        <!-- Role -->
        <label>Role</label>
        <select v-model="role">
            <option value="vuejs-eveloper">VueJS Developer</option>
            <option value="react-developer">React Developer</option>
            <option value="angular-developer">Angular Developer</option>
        </select>

        <!-- Skills -->
        <label>Skills</label>
        <input type="text" v-model="tempSkill" @keyup.alt="addSkill">   <!-- keyboard event modifier --> 
        <div v-for="skill in skills" :key="skill" class="pill" >
            <span @click="deleteSkill(skill)">{{ skill }}</span>
        </div>

        <br>
        <!-- Password -->
        <label for="password">Password</label>
        <input type="password" required name="password" v-model="password">
        <div v-if="passwordError" class="error">
            {{ passwordError }}
        </div>

        <!-- T&C -->
        <div class="terms">
            <input type="checkbox" v-model="terms" required>
            <label>Accept terms & conditions</label>
        </div>

        <div class="submit">
            <button>Create an Account</button>
        </div>

        <!-- How to work with multiple checkboxex -->
        <!-- 
        <div>
            <input type="checkbox" value="mitesh" v-model="names">
            <label>Mitesh</label>
        </div>
        <div>
            <input type="checkbox" value="bhavisha" v-model="names">
            <label>Bhavisha</label>
        </div>
        <div>
            <input type="checkbox" value="dipak" v-model="names">
            <label>Dipak</label>
        </div> -->

    </form>

    <div>
        <p>Full Name: {{ fName }}</p>
        <p>Email: {{ email }}</p>
        <p>Role: {{ role }}</p>
        <p>Password: {{ password }}</p>
        <p>Terms accepted: {{ terms }}</p>
        <!-- <p>Names: {{ names }}</p> -->
    </div>
</template>

<script>
export default {
    data() {
        return {
            // we are saving all data using v-model to here
            fName: '',
            email: '',
            role: '',
            password: '',
            terms: false,
            // names: [],
            tempSkill: '',
            skills: [], 
            passwordError: ''
        }
    },

    methods: {
        addSkill(e) {
            // console.log(e);
            if(e.key === ',' && this.tempSkill) {
                if(!this.skills.includes(this.tempSkill)) {
                    this.skills.push(this.tempSkill);
                }
                this.tempSkill = '';
            }
        },

        deleteSkill(skill) {
            // console.log('skill', skill)
            this.skills = this.skills.filter((item) => {
                // console.log('item', item)
                return skill !== item;   // if matches, returns false and remove skill from skills and added to new array
            })
            console.log(this.skills)
        },

        handleSubmit() {
            // password validation
            this.passwordError = this.password.length > 5 ? '' : 'Password must be contain at least 6 characters';

            if(!this.passwordError) {
                console.log('Full Name: ', this.fName);
                console.log('Email: ', this.email);
                console.log('Role: ', this.role);
                console.log('Skill: ', this.skills);
                console.log('Password: ', this.password);
            }
        }
    }
}
</script>

<style>
form {
    max-width: 420px;
    margin: 30px auto;
    background: white;
    text-align: left;
    padding: 40px;
    border-radius: 10px;
}

label {
    color: #aaa;
    display: inline-block;
    margin: 25px 0 15px;
    font-size: 0.6em;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: bold;
}

input,
select {
    display: block;
    padding: 10px 6px;
    width: 100%;
    box-sizing: border-box;
    border: none;
    border-bottom: 1px solid #ddd;
    color: #555
}

input[type="checkbox"] {
    display: inline-block;
    width: 16px;
    margin: 0 10px 0 0;
    position: relative;
    top: 2px;
}
.pill {
    display: inline-block;
    margin: 20px 10px 0 0;
    padding: 6px 12px;
    background: #eee;
    border-radius: 20px;
    font-size: 12px;
    letter-spacing: 1px;
    font-weight: bold;
    color: #777;
    cursor: pointer;
}
button {
    background: #0b6dff;
    border: 0;
    padding: 10px 20px;
    margin-top: 20px;
    color: white;
    border-radius: 20px;
}
.submit {
    text-align: center;
}
.error {
    color: #ff0062;
    margin-top: 10px;
    font-size: 0.8em;
    font-weight: bold;
}
</style>