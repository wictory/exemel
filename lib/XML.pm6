## XML -- Object Oriented XML Library
use XML::Element;
use XML::Document;

module XML
{
  sub from-xml (Str $xml-string) is export
  {
    return XML::Document.new($xml-string);
  }

  sub from-xml-stream (IO::Handle $input) is export
  {
    return XML::Document.new($input.slurp-rest);
  }

  sub from-xml-file (Cool:D $file) is export
  {
    return XML::Document.load($file);
  }

  sub make-xml (Str $name, *@contents, *%attribs) is export
  {
    return XML::Element.craft($name, |@contents, |%attribs);
  }

  multi sub open-xml (Cool:D $src where .IO.e && !.IO.d) is export {
    from-xml-file $src
  }

  multi sub open-xml (Cool:D $src where .isa(Str)) is export {
    from-xml $src
  }

  multi sub open-xml (IO::Handle $src) is export {
    from-xml-stream $src
  }

}
