%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
  poet = \markup{ \fontsize #4 \smallCaps "The Word of God, Proceeding Forth"  }
  meter = \markup { \small { Music: DUGUET, L.M.; Abbé Duguet; harm. \italic "The English Hymnal"} }
  piece = \markup { \small {Text: \italic "Verbum supernum prodiens," Thomas Aquinas; tr. J.M. Neale, E. Caswall, and others }}
  %breakbefore
  %copyright = ""
  tagline = ""

}

global = {
  \key ef \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  ef4 |
  g f g af |
  g f ef \bar "||"

  g4 |
  g f g bf |
  a4. bf8 bf4 \bar "||"

  bf4 |
  c bf g af |
  bf af8[ g] f4 \bar "||"

  g4 |
  ef f g af |
  g f4 ef \bar "|."
}

alto = \relative c' {
  \global
  \partial 4

  bf4 |
  ef c8[ d] ef4 ef |
  ef d c

  c |
  bf f' ef g |
  f4. f8 f4

  g4 |
  af g8[ f] ef4 f |
  f f8[ ef] d4

  ef4 |
  c d ef ef |
  ef d ef

}

tenor = \relative c' {
  \global
  \partial 4

  g4 |
  bf af bf c |
  bf bf g

  ef8[ f] |
  g4 bf bf ef8[ d] |
  c4. d8 d4

  ef4 |
  ef d c c |
  bf bf bf

  bf |
  c bf8[ af] bf4 c |
  bf bf g
}

bass = \relative c {
  \global
  \partial 4
  ef4 |
  ef f ef af, |
  bf bf c

  c8[ d] |
  ef4 d ef c |
  f4. bf,8 bf4

  ef4 |
  af, bf c f |
  d ef bf

  ef |
  af g8[ f] ef4 af, |
  bf bf ef
}

verseOne = \lyricmode {
  \set stanza = "1."
  The Word of God, pro -- ceed -- ing forth
  Yet leav -- ing not His Fa -- ther's side,
  And go -- ing to His work on earth,
  Had reached at length life's ev -- en -- tide;
}

verseTwo = \lyricmode {
  \set stanza = "2."
  By false dis -- ci -- ple to be giv'n
  To foe -- men for His blood a -- thirst,
  Him -- self, the liv -- ing Bread from heav'n,
  He gave to his dis -- ci -- ples first.
}

verseThree = \lyricmode {
  \set stanza = "3."
  In two -- fold form of sa -- cra -- ment
  He gave His Flesh, He gave His Blood,
  That man, of two -- fold sub -- stance blent,
  Might whol -- ly feed on mys -- tic food.
}

verseFour = \lyricmode {
  \set stanza = "4."
  In birth man's fel -- low -- man was He,
  His meat while sit -- ting at the board;
  He died, His ran -- som -- er to be,
  He reigns to be his great re -- ward.
}

verseFive = \lyricmode {
  \set stanza = "5."
  O sav -- ing Vic -- tim! o -- p'ning wide
  The gate of heav'n to man be -- low,
  Our foes press hard on ev' -- ry side,
  Thine aid sup -- ply, Thy strength be -- stow.
}

verseSix = \lyricmode {
  \set stanza = "6."
  All praise and thanks to Thee as -- cend
  For ev -- er -- more, blest One in Three;
  O grant us life that shall not end
  In our true na -- tive land with Thee.
}


\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
      sopranos { \voiceOne << \melody >> }
      \context Voice =
      altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
      \context Lyrics = two \lyricsto sopranos \verseTwo
      \context Lyrics = three \lyricsto sopranos \verseThree
      \context Lyrics = four \lyricsto sopranos \verseFour
      \context Lyrics = five \lyricsto sopranos \verseFive
      \context Lyrics = six \lyricsto sopranos \verseSix

    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenor >> }
      \context Voice =
      basses { \voiceTwo << \bass >> }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 72 4)
    }
  }

  \layout {}
}

