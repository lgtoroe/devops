var ffmpeg = require('fluent-ffmpeg');
//var command = ffmpeg();


Ffmpeg.getAvailableFormats(function(err, formats) {
  console.log('Available formats:');
  console.dir(formats);
});

Ffmpeg.getAvailableCodecs(function(err, codecs) {
  console.log('Available codecs:');
  console.dir(codecs);
});

Ffmpeg.getAvailableEncoders(function(err, encoders) {
  console.log('Available encoders:');
  console.dir(encoders);
});

Ffmpeg.getAvailableFilters(function(err, filters) {
  console.log("Available filters:");
  console.dir(filters);
});

// Those methods can also be called on commands
new Ffmpeg({ source: '406670BR.mov' })
  .getAvailableCodecs(...);