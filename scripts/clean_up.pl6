use v6.c;

sub MAIN ($filename) {
  die "File '{ $filename }' does not exist!" unless $filename.IO.e;

  $_ = $filename.IO.slurp;
  $filename.IO.rename("{ $filename }.bak_clean");

  my $is_raw = $filename.IO.absolute.contains('/Raw');

  say "»» Backup file created as '{ $filename }.bak_clean ««";

  my $r;

  # Common search and replace operations
  if $is_raw {
    $r = s:g/'GError $error'/CArray[Pointer[GError]] \$error/;
      say 'Replacing GError parameters with its proper form...' if $r;
    $r = s:g/«g?char \$/Str \$/;
      say 'Replacing (g)char with Str...' if $r;
    $r = s:g/'GAsyncReadyCallback $'(<[a..z]>+)/\&$0 (Pointer, GAsyncResult, Pointer)/;
      say 'Replacing GAsyncReadyCallback with proper handler def...' if $r;
  } else {
    $r = s:g/'() {'/\{/;
      say 'Removing empty parameter lists...' if $r;
    $r = s:g/'GError $error'/CArray[Pointer[GError]] \$error = gerror()/;
      say 'Replacing GError parameters with its proper form...' if $r;
    $r = s:g/«'int'\s/int32/;
      say 'Replacing bare int with int32' if $r;
    $r = s:g/«g?char \$/Str ()\$/;
      say 'Replacing (g)char with Str...' if $r;
    $r = s:g/'GAsyncReadyCallback $'(<[a..z]>+)/\&$0/;
      if $r {
        say 'Replacing GAsyncReadyCallback with bare &parameter...';
        # Trigger a replacement of all callback variables
        for $/[0].List -> $cb {
          say "\t* Replacing \${ $cb } with \&{ $cb }...";
          s:g/'$'$cb/\&$cb/;
        }
      }
  }

  $filename.IO.spurt($_);

  say '»» DONE ««';
}
