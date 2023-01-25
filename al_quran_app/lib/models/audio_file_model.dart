// ignore_for_file: prefer_void_to_null, unnecessary_question_mark

class AudioFileModel {
  int? qariId;
  int? surahId;
  int? mainId;
  int? recitationId;
  Null filenum;
  String? fileName;
  String? extension;
  int? streamCount;
  int? downloadCount;
  Format? format;
  Metadata? metadata;
  Qari? qari;

  AudioFileModel(
      {this.qariId,
      this.surahId,
      this.mainId,
      this.recitationId,
      this.filenum,
      this.fileName,
      this.extension,
      this.streamCount,
      this.downloadCount,
      this.format,
      this.metadata,
      this.qari});

  AudioFileModel.fromJson(Map<String, dynamic> json) {
    qariId = json['qari_id'];
    surahId = json['surah_id'];
    mainId = json['main_id'];
    recitationId = json['recitation_id'];
    filenum = json['filenum'];
    fileName = json['file_name'];
    extension = json['extension'];
    streamCount = json['stream_count'];
    downloadCount = json['download_count'];
    format = json['format'] != null ? Format.fromJson(json['format']) : null;
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    qari = json['qari'] != null ? Qari.fromJson(json['qari']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['qari_id'] = qariId;
    data['surah_id'] = surahId;
    data['main_id'] = mainId;
    data['recitation_id'] = recitationId;
    data['filenum'] = filenum;
    data['file_name'] = fileName;
    data['extension'] = extension;
    data['stream_count'] = streamCount;
    data['download_count'] = downloadCount;
    if (format != null) {
      data['format'] = format!.toJson();
    }
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    if (qari != null) {
      data['qari'] = qari!.toJson();
    }
    return data;
  }
}

class Format {
  String? size;
  String? bitRate;
  String? duration;
  int? nbStreams;
  String? startTime;
  String? formatName;
  int? nbPrograms;
  int? probeScore;
  String? formatLongName;

  Format(
      {this.size,
      this.bitRate,
      this.duration,
      this.nbStreams,
      this.startTime,
      this.formatName,
      this.nbPrograms,
      this.probeScore,
      this.formatLongName});

  Format.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    bitRate = json['bit_rate'];
    duration = json['duration'];
    nbStreams = json['nb_streams'];
    startTime = json['start_time'];
    formatName = json['format_name'];
    nbPrograms = json['nb_programs'];
    probeScore = json['probe_score'];
    formatLongName = json['format_long_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['size'] = size;
    data['bit_rate'] = bitRate;
    data['duration'] = duration;
    data['nb_streams'] = nbStreams;
    data['start_time'] = startTime;
    data['format_name'] = formatName;
    data['nb_programs'] = nbPrograms;
    data['probe_score'] = probeScore;
    data['format_long_name'] = formatLongName;
    return data;
  }
}

class Metadata {
  String? date;
  String? album;
  String? genre;
  String? title;
  String? track;
  String? artist;
  String? comment;
  String? encoder;

  Metadata(
      {this.date,
      this.album,
      this.genre,
      this.title,
      this.track,
      this.artist,
      this.comment,
      this.encoder});

  Metadata.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    album = json['album'];
    genre = json['genre'];
    title = json['title'];
    track = json['track'];
    artist = json['artist'];
    comment = json['comment'];
    encoder = json['encoder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['album'] = album;
    data['genre'] = genre;
    data['title'] = title;
    data['track'] = track;
    data['artist'] = artist;
    data['comment'] = comment;
    data['encoder'] = encoder;
    return data;
  }
}

class Qari {
  int? id;
  String? name;
  String? arabicName;
  String? relativePath;
  String? fileFormats;
  int? sectionId;
  bool? home;
  String? description;
  Null? torrentFilename;
  Null? torrentInfoHash;
  int? torrentSeeders;
  int? torrentLeechers;

  Qari(
      {this.id,
      this.name,
      this.arabicName,
      this.relativePath,
      this.fileFormats,
      this.sectionId,
      this.home,
      this.description,
      this.torrentFilename,
      this.torrentInfoHash,
      this.torrentSeeders,
      this.torrentLeechers});

  Qari.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    arabicName = json['arabic_name'];
    relativePath = json['relative_path'];
    fileFormats = json['file_formats'];
    sectionId = json['section_id'];
    home = json['home'];
    description = json['description'];
    torrentFilename = json['torrent_filename'];
    torrentInfoHash = json['torrent_info_hash'];
    torrentSeeders = json['torrent_seeders'];
    torrentLeechers = json['torrent_leechers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['arabic_name'] = arabicName;
    data['relative_path'] = relativePath;
    data['file_formats'] = fileFormats;
    data['section_id'] = sectionId;
    data['home'] = home;
    data['description'] = description;
    data['torrent_filename'] = torrentFilename;
    data['torrent_info_hash'] = torrentInfoHash;
    data['torrent_seeders'] = torrentSeeders;
    data['torrent_leechers'] = torrentLeechers;
    return data;
  }
}
