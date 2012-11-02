# iteego/puppet.apt
## License
    iteego/puppet.apt: puppet recipes for using amazon apt
    
     Copyright 2012 Iteego, Inc.
     Author: Marcus Pemer <marcus@iteego.com>
    
     iteego/puppet.apt is free software: you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
     the Free Software Foundation, either version 3 of the License, or
     (at your option) any later version.
     iteego/puppet.s3fs is distributed in the hope that it will be useful,
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     GNU General Public License for more details.
    
     You should have received a copy of the GNU General Public License
     along with iteego/puppet.apt.  If not, see <http://www.gnu.org/licenses/>.
    

## apt puppet module

The apt puppet module allows you to interact with the Amazon apt system.

You would include the module under your puppet modules directory
as a git submodule, like so:

    cd <your puppet repo>/modules
    git submodule add git@github.com:iteego/puppet.apt.git apt
    git submodule update

Don't forget to commit your submodule ref in your parent repository

## Example Usage

After this is done, you can use the submodule like so:

    include apt

    .
    .
    .
    # Run this once:
    apt::s3fs_installation { 's3fs_installation': }

    # Run one of these for each mount point you want
    # note that the buckets have to exist
    # the module does not automatically create them...
    #
    apt::s3fs_mount { 'some-unique-name-of-your-choice':
      bucket            => '<YOUR BUCKET NAME>',
      access_key        => '<YOUR ACCESS KEY>',
      secret_access_key => '<YOUR SECRET ACCESS KEY>',
    }


## Future Improvements

There are several areas where this module could be improved. Examples would include:
* Support for other Operating systems than the Debian-based Linux distributions

You are welcome to contribute to this project by forking it and submitting pull requests to the project maintainers (organization: iteego, current maintaners: mpemer and mbjarland)
