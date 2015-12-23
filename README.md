Gentoo overlay
===================

Gentoo overlay for personal ebuilds that are not suitable for official (or any other) ebuild repository. Layman configuration files as well as structure of this README file has been copied over from [CTU Overlay](https://github.com/cvut/gentoo-overlay) maintained by Jakub Jirutka (many thanks!).


List of ebuilds
---------------

* **app-emulation/lxc-templates** (0.0.1)


Usage
-----

### Layman

This overlay is on the [Gentoo Overlays](https://overlays.gentoo.org/) list, so you can easily add it to your system using [Layman](https://wiki.gentoo.org/wiki/Layman):

```sh
layman -a cvut
```

To synchronize it, run: `layman -s cvut`.

### Portage

Starting with sys-apps/portage-2.2.16, Portage now has a new modular plug-in [sync system](https://wiki.gentoo.org/wiki/Project:Portage/Sync).
This makes Layman and other similar tools unnecessary for managing overlays like this one.

1. Prepare location for the overlay, e.g. `/usr/local/portage/cvut`:

   ```sh
   mkdir -p /usr/local/portage/geostarling
   ```

2. Create file `/etc/portage/repos.conf/geostarling.conf`:

   ```ini
   [cvut]
   location = /usr/local/portage/cvut
   sync-type = git
   sync-uri = git://github.com/geostarling/gentoo-overlay
   auto-sync = yes
   ```

3. Synchronize repository:

   ```sh
   emerge --sync cvut
   eix-update  # run only if you use eix
   ```

Overlay will be automatically synchronized when running `emerge --sync` or `eix-sync`.


Maintainers
-----------

* [Jiri Spacek](mailto:spacekj3@gmail.com)