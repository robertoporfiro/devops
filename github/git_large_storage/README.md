# Git Large File Storage

| Linux | 
| :---- |
[ ![Linux build status][1]][2]

[1]: https://travis-ci.org/git-lfs/git-lfs.svg?branch=master
[2]: https://travis-ci.org/git-lfs/git-lfs

[Git LFS](https://git-lfs.github.com), site
The client is written in Go

## Getting Started

### Installation

You can install the Git LFS client in several different ways, depending on your
setup and preferences.

* **Linux users**. Debian and RPM packages are available from
[PackageCloud](https://packagecloud.io/github/git-lfs/install)
[Wiki](https://github.com/git-lfs/git-lfs/wiki/Installation#source).

### Usage

Git LFS requires a global installation once per-machine. This can be done by
running:

```bash
$ git lfs install
```

To begin using Git LFS within your Git repository, you can indicate which files
you would like Git LFS to manage. This can be done by running the following
_from within Git repository_:

```bash
$ git lfs track "*.psd"
```

(Where `*.psd` is the pattern of filenames that you wish to track. You can read
more about this pattern syntax
[here](https://git-scm.com/docs/gitattributes)).

After any invocation of `git-lfs-track(1)` or `git-lfs-untrack(1)`, you _must
commit changes to your `.gitattributes` file_. This can be done by running:

```bash
$ git add .gitattributes
$ git commit -m "track *.psd files using Git LFS"
```

You can now interact with your Git repository as usual, and Git LFS will take
care of managing your large files. For example, changing a file named `my.psd`
(tracked above via `*.psd`):

```bash
$ git add my.psd
$ git commit -m "add psd"
```
### Tracking: 

```Git init 
Git lfs track "name_date" ```

### View tracks: 
`git lfs track`

### Example of track: 
`git lfs track "*.csv"`

The [official documentation](docs) has command references and specifications for
the tool.
