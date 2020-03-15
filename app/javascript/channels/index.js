// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.
import 'bootstrap';

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

import "bootstrap/js/src/alert"
import "bootstrap/js/src/button"
import "bootstrap/js/src/carousel"
import "bootstrap/js/src/collapse"
import "bootstrap/js/src/dropdown"
import "bootstrap/js/src/modal"
import "bootstrap/js/src/popover"
import "bootstrap/js/src/scrollspy"
import "bootstrap/js/src/tab"
import "bootstrap/js/src/toast"
import "bootstrap/js/src/tooltip"
