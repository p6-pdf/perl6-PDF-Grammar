use v6;

use PDF::Grammar::PDF;

grammar PDF::Grammar::FDF
    is PDF::Grammar::PDF {
    #
    # An experimental Perl6 grammar for scanning the basic outer block
    # structure of FDF form data exchange files.
    #
    rule TOP {^<fdf>$}
    rule fdf {<fdf-header> [<body>+]'%%EOF' }

    token fdf-header {'%FDF-'$<version>=(\d'.'\d)}

    token trailer {
        trailer<.eol>
        <dict><.eol>
        [ startxref<.eol>
          <byte-offset=.digits><.eol>
        ]?
    }

}
