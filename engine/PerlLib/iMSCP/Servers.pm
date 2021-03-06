=head1 NAME

 iMSCP::Servers - Package which allow to retrieve i-MSCP server list

=cut

# i-MSCP - internet Multi Server Control Panel
# Copyright (C) 2010-2016 by Laurent Declercq <l.declercq@nuxwin.com>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

package iMSCP::Servers;

use strict;
use warnings;
use File::Basename;
use parent 'Common::SingletonClass';

=head1 DESCRIPTION

 Package which allow servers list retrieval.

=head1 PUBLIC METHODS

=over 4

=item get()

 Get servers list

 Return server list

=cut

sub get
{
    @{$_[0]->{'servers'}};
}

=back

=head1 PRIVATE METHODS

=over 4

=item _init()

 Initialize instance

 Return iMSCP::Servers

=cut

sub _init
{
    my $self = shift;

    $_ = basename( $_, '.pm' ) for @{$self->{'servers'}} = glob(
        "$main::imscpConfig{'ENGINE_ROOT_DIR'}/PerlLib/Servers/*.pm"
    );

    $self;
}

=back

=head1 AUTHOR

Laurent Declercq <l.declercq@nuxwin.com>

=cut

1;
__END__
