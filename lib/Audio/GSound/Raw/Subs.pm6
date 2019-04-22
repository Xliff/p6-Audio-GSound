use v6.c;

use NativeCall;

use GTK::Compat::Types;
use Audio::GSound::Raw::Types;

unit package Audio::GSound::Raw::Subs;

sub gsound_context_cachev (
  GSoundContext $context,
  GHashTable $attrs,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gsound)
  is export
  { * }

sub gsound_context_get_type ()
  returns GType
  is native(gsound)
  is export
  { * }

sub gsound_error_quark ()
  returns GQuark
  is native(gsound)
  is export
  { * }

sub gsound_context_new (
  GCancellable $cancellable,
  CArray[Pointer[GError]] $error
)
  returns GSoundContext
  is native(gsound)
  is export
  { * }

sub gsound_context_open (
  GSoundContext $context,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gsound)
  is export
  { * }

sub gsound_context_play_full_finish (
  GSoundContext $context,
  GAsyncResult $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gsound)
  is export
  { * }

sub gsound_context_play_fullv (
  GSoundContext $context,
  GHashTable $attrs,
  GCancellable $cancellable,
  &callback (Pointer, GAsyncResult, Pointer),
  gpointer $user_data
)
  is native(gsound)
  is export
  { * }

sub gsound_context_play_simplev (
  GSoundContext $context,
  GHashTable $attrs,
  GCancellable $cancellable,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gsound)
  is export
  { * }

sub gsound_context_set_attributesv (
  GSoundContext $context,
  GHashTable $attrs,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gsound)
  is export
  { * }

sub gsound_context_set_driver (
  GSoundContext $context,
  Str $driver,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(gsound)
  is export
  { * }

sub gsound_context_play_simple (
  GSoundContext $context,
  GCancellable $cancellable,
  CArray[Pointer[GError]] $error,
  Str $attr,
  Str $val,
  Str
)
  returns uint32
  is native(gsound)
  is export
  { * }
