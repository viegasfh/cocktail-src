-- $Id:$

class ScanAttribute

-- subclasses of ScanAttribute may be defined by the user
-- in order to describe additional properties of tokens

inherit Attribute

creation make

feature

Position	: Position

make is
   do
      !! Position.make
   end

end
