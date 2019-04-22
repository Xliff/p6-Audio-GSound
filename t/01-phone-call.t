use v6.c;

use GTK::Compat::Types;
use Audio::GSound;

sub MAIN ($filename) {
  my $ctx = Audio::GSound.new;
  die "ERROR encountered: { $ERROR.message }" if $ERROR.defined;

  #$ctx.play_simple(GSOUND_ATTR_EVENT_ID, 'phone-incoming-call');
  die "ERROR encountered: { $ERROR.message }" if $ERROR.defined;

  $ctx.play_simple(GSOUND_ATTR_MEDIA_FILENAME, $filename);

  say "Phones's ringing! It's for you!";
}
