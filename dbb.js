const express = require('express');
const oracledb = require('oracledb');
const app = express();
app.use(express.json());
const cors = require('cors');
app.use(cors());


app.post('/addUser', async (req, res) => {
    let connection;
    try {
        connection = await oracledb.getConnection({
            user: "system",
            password: "123456",
            connectString: "localhost:1521/ORCLPDB"
        }
        );

        const result = await connection.execute(
            'INSERT INTO signup (username, email, password) VALUES (:username, :email, :password)',
            { 
                username: req.body.username,
                email: req.body.email,
                password: req.body.password,
                
            }  // bind parameters
        );
        await connection.execute('commit');
        res.json({ message: 'Successfully added user', result });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: err.message });
    } finally {
        if (connection) {
            try {
                await connection.close();
            } catch (err) {
                console.error(err);
            }
        }
    }
});
app.listen(3000, () => console.log('Server started on port 3000'));