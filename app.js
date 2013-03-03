var config = require('./config');
var Bot = require('./lib/bot');
var bot = new Bot({
	config: config
});
bot.run();