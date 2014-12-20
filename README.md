docker-bower
============

Develop [Bower](http://bower.io) projects without installing bower on your host system.

Background
----------

[Bower](http://bower.io) is a dependency management tool often used in Web front-end development.
For example, the [Polymer project](https://www.polymer-project.org) uses [Bower](http://bower.io) as its recommended installation tool.

If you check out a [Bower](http://bower.io)-based project from [GitHub](https://github.com), it will typically contain a `bower.json` file which lists the dependencies for that project. In order to download these dependencies, you run

    bower install

which will create a sub-folder `bower_components` and download the dependencies there.

About docker-bower
------------------

If you want to play with a [Bower](http://bower.io)-based project like [Polymer](https://www.polymer-project.org), you might not want to install [Bower](http://bower.io) and all its dependencies on your system. With _docker-bower_ you can isolate the environment in a [Docker](https://www.docker.com) container and install all dependencies there.

How To
------

1. Make sure [Docker](https://www.docker.com) is installed.
2. Make sure you have your [Bower](http://bower.io)-based project in a directory like `/path/to/my-project`, and it contains the file `/path/to/my-project/bower.json`
3. Check out _docker-bower_ from [GitHub](https://github.com)

   ```bash
   git clone https://github.com/fstab/docker-bower.git
   ```
4. Build the docker image

   ```bash
   cd docker-bower
   docker build -t="fstab/ubuntu-with-bower:v1" .
   ```

5. Run a docker container from that image, and map `/path/to/my-project` into that container

   ```bash
   MY_PROJECT="/path/to/my-project"
   docker run -v "$MY_PROJECT:/home/bower/workspace" -t -i fstab/ubuntu-with-bower:v1
   ```

The container will spawn a `bash` shell that you can use to run [Bower](http://bower.io) commands (like `bower install --save` for adding new bower components), and it runs a HTTP server on port `8000` for viewing the project.
