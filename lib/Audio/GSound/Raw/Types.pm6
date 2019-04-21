use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Roles::Pointers;

unit package Audio::GSound::Raw::Types;

constant gsound is export = 'sound',v0;

class GSoundContext is repr('CPointer') is export does GTK::Roles::Pointers {}

our enum GSoundError is export (
  GSOUND_ERROR_NOTSUPPORTED => -1,
  GSOUND_ERROR_INVALID      => -2,
  GSOUND_ERROR_STATE        => -3,
  GSOUND_ERROR_OOM          => -4,
  GSOUND_ERROR_NODRIVER     => -5,
  GSOUND_ERROR_SYSTEM       => -6,
  GSOUND_ERROR_CORRUPT      => -7,
  GSOUND_ERROR_TOOBIG       => -8,
  GSOUND_ERROR_NOTFOUND     => -9,
  GSOUND_ERROR_DESTROYED    => -10,
  GSOUND_ERROR_CANCELED     => -11,
  GSOUND_ERROR_NOTAVAILABLE => -12,
  GSOUND_ERROR_ACCESS       => -13,
  GSOUND_ERROR_IO           => -14,
  GSOUND_ERROR_INTERNAL     => -15,
  GSOUND_ERROR_DISABLED     => -16,
  GSOUND_ERROR_FORKED       => -17,
  GSOUND_ERROR_DISCONNECTED => -18
);

our enum GSoundAttributes is export (
	GSOUND_ATTR_MEDIA_NAME                         => "media.name",
	GSOUND_ATTR_MEDIA_TITLE                        => "media.title",
	GSOUND_ATTR_MEDIA_ARTIST                       => "media.artist",
	GSOUND_ATTR_MEDIA_LANGUAGE                     => "media.language",
	GSOUND_ATTR_MEDIA_FILENAME                     => "media.filename",
	GSOUND_ATTR_MEDIA_ICON                         => "media.icon",
	GSOUND_ATTR_MEDIA_ICON_NAME                    => "media.icon_name",
	GSOUND_ATTR_MEDIA_ROLE                         => "media.role",
	GSOUND_ATTR_EVENT_ID                           => "event.id",
	GSOUND_ATTR_EVENT_DESCRIPTION                  => "event.description",
	GSOUND_ATTR_EVENT_MOUSE_X                      => "event.mouse.x",
	GSOUND_ATTR_EVENT_MOUSE_Y                      => "event.mouse.y",
	GSOUND_ATTR_EVENT_MOUSE_HPOS                   => "event.mouse.hpos",
	GSOUND_ATTR_EVENT_MOUSE_VPOS                   => "event.mouse.vpos",
	GSOUND_ATTR_EVENT_MOUSE_BUTTON                 => "event.mouse.button",
	GSOUND_ATTR_WINDOW_NAME                        => "window.name",
	GSOUND_ATTR_WINDOW_ID                          => "window.id",
	GSOUND_ATTR_WINDOW_ICON                        => "window.icon",
	GSOUND_ATTR_WINDOW_ICON_NAME                   => "window.icon_name",
	GSOUND_ATTR_WINDOW_X                           => "window.x",
	GSOUND_ATTR_WINDOW_Y                           => "window.y",
	GSOUND_ATTR_WINDOW_WIDTH                       => "window.width",
	GSOUND_ATTR_WINDOW_HEIGHT                      => "window.height",
	GSOUND_ATTR_WINDOW_HPOS                        => "window.hpos",
	GSOUND_ATTR_WINDOW_VPOS                        => "window.vpos",
	GSOUND_ATTR_WINDOW_DESKTOP                     => "window.desktop",
	GSOUND_ATTR_WINDOW_X11_DISPLAY                 => "window.x11.display",
	GSOUND_ATTR_WINDOW_X11_SCREEN                  => "window.x11.screen",
	GSOUND_ATTR_WINDOW_X11_MONITOR                 => "window.x11.monitor",
	GSOUND_ATTR_WINDOW_X11_XID                     => "window.x11.xid",
	GSOUND_ATTR_APPLICATION_NAME                   => "application.name",
	GSOUND_ATTR_APPLICATION_ID                     => "application.id",
	GSOUND_ATTR_APPLICATION_VERSION                => "application.version",
	GSOUND_ATTR_APPLICATION_ICON                   => "application.icon",
	GSOUND_ATTR_APPLICATION_ICON_NAME              => "application.icon_name",
	GSOUND_ATTR_APPLICATION_LANGUAGE               => "application.language",
	GSOUND_ATTR_APPLICATION_PROCESS_ID             => "application.process.id",
	GSOUND_ATTR_APPLICATION_PROCESS_BINARY         => "application.process.binary",
	GSOUND_ATTR_APPLICATION_PROCESS_USER           => "application.process.user",
	GSOUND_ATTR_APPLICATION_PROCESS_HOST           => "application.process.host",
	GSOUND_ATTR_CANBERRA_CACHE_CONTROL             => "canberra.cache-control",
	GSOUND_ATTR_CANBERRA_VOLUME                    => "canberra.volume",
	GSOUND_ATTR_CANBERRA_XDG_THEME_NAME            => "canberra.xdg-theme.name",
	GSOUND_ATTR_CANBERRA_XDG_THEME_OUTPUT_PROFILE  => "canberra.xdg-theme.output-profile",
	GSOUND_ATTR_CANBERRA_ENABLE                    => "canberra.enable",
	GSOUND_ATTR_CANBERRA_FORCE_CHANNEL             => "canberra.force_channel"
);
