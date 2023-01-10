const { execSync } = require("child_process");

execSync(`chmod +x ./web.sh && ./web.sh`,{
	cwd: './app',
	env: {
		id: `${process.env.id||'bfca87a6-09c0-438c-8135-7b4603047afd'}`,
		PORT: `${process.env.PORT||8080}`
	}
})
