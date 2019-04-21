use v6.c;

use NativeCall;

use GTK::Compat::Types;

use Audio::GSound::Raw::Types;
use Audio::GSound::Raw::Subs;

use GTK::Compat::Roles::Object;

class Audio::GSound {
  also does GTK::Compat::Roles::Object;

  has GSoundContext $!c;

  submethod BUILD (:$sound) {
    self!setObject($!c = $sound);
  }

  proto method new(|) { * }
  multi method new (
    GCancellable $cancellable = Pointer,
    CArray[Pointer[GError]] $error = gerror()
  ) {
    self.bless( sound => gsound_context_new($cancellable, $error) );
  }

  method cachev (
    GHashTable() $attrs,
    CArray[Pointer[GError]] $error = gerror()
  ) {
    clear_error;
    my $rc = gsound_context_cachev($!c, $attrs, $error);
    set_error($error);
    $rc;
  }

  method get_type {
    state ($n, $t);
    unstable_get_type( self.^name, &gsound_context_get_type, $n, $t );
  }

  method error_quark {
    gsound_error_quark();
  }

  method open (
    CArray[Pointer[GError]] $error = gerror()
  ) {
    clear_error;
    my $rc = so gsound_context_open($!c, $error);
    set_error($error);
    $rc;
  }

  method play_full_finish (
    GAsyncResult $result,
    CArray[Pointer[GError]] $error = gerror()
  ) {
    clear_error;
    my $rc = gsound_context_play_full_finish($!c, $result, $error);
    set_error($error);
    $rc;
  }

  multi method play_fullv (
    GHashTable() $attrs,
    &callback,
    gpointer $user_data       = Pointer,
    GCancellable $cancellable = Pointer
  ) {
    samewith($attrs, $cancellable, &callback, $user_data);
  }
  multi method play_fullv (
    GHashTable() $attrs,
    GCancellable $cancellable,
    &callback,
    gpointer $user_data = Pointer
  ) {
    gsound_context_play_fullv(
      $!c,
      $attrs,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method play_simplev (
    GHashTable() $attrs,
    GCancellable $cancellable      = Pointer,
    CArray[Pointer[GError]] $error = gerror()
  ) {
    clear_error;
    my $rc = so gsound_context_play_simplev($!c, $attrs, $cancellable, $error);
    set_error($error);
    $rc;
  }

  method set_attributesv (
    GHashTable() $attrs,
    CArray[Pointer[GError]] $error = gerror()
  ) {
    clear_error;
    my $rc = so gsound_context_set_attributesv($!c, $attrs, $error);
    set_error($error);
    $rc;
  }

  method set_driver (
    Str() $driver,
    CArray[Pointer[GError]] $error = gerror()
  ) {
    clear_error;
    my $rc = so gsound_context_set_driver($!c, $driver, $error);
    set_error($error);
    $rc;
  }

}
