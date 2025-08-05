enum ComicFormat {
  comic('comic'),
  magazine('magazine'),
  tradePaperback('trade paperback'),
  hardcover('hardcover'),
  digest('digest'),
  graphicNovel('graphic novel'),
  digitalComic('digital comic'),
  infiniteComic('infinite comic');

  const ComicFormat(this.value);

  final String value;
}

enum ComicFormatType {
  comic('comic'),
  collection('collection');

  const ComicFormatType(this.value);

  final String value;
}

enum DateDescriptor {
  lastWeek('lastWeek'),
  thisWeek('thisWeek'),
  nextWeek('nextWeek'),
  thisMonth('thisMonth');

  const DateDescriptor(this.value);

  final String value;
}

enum SeriesType {
  collection('collection'),
  oneShot('one shot'),
  limited('limited'),
  ongoing('ongoing');

  const SeriesType(this.value);

  final String value;
}
