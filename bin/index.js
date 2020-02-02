const program = require('commander');
// const movein = require('./movein');
// const moveout = require('./moveout');

const VERSION = require('../package.json').version;
program
  .version(VERSION)
  .command('in', 'move config into your machine from this repo')
  .command('out', 'move config out of your machine into this repo')
  .action(run)
  .parse(process.argv);


function run(env, options) {
  console.log(env);
  console.log(options);

}
