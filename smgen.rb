filename = "steps.sm"

if ARGV[0] != nil
  MEASURES = ARGV[0].to_i
else
  MEASURES = 10
end

if ARGV[1] != nil
  DIVISOR = ARGV[1].to_i
else
  DIVISOR = 4
end

DIFFICULTY="3"

puts "Generating #{MEASURES*DIVISOR} arrows"

DIFFICULTY_NAME="Begginer"
RADAR="0.143,0.181,0.152,0.000,0.000"


TITLE="Un lobato cazó un ovejo blanco"
TITLETRANSLIT=""
SUBTITLE="En el BK de Parquesur"
SUBTITLETRANSLIT=""
ARTIST="Ovejo"
CREDIT=""
MUSIC="music.ogg"
BANNER="banner.png"
BACKGROUND="bg.png"
LYRICSPATH=""
CDTITLE=""
OFFSET="0.000"
SAMPLESTART="0.000"
SAMPLELENGTH="15.000"
STOPS=""
BGCHANGES=""
SELECTABLE="YES"
BPM="300"

file_headers = Array.new
file_difficulties = Array.new
difficulty_data = Array.new


title_tag = "#TITLE"
file_headers << "#{title_tag}:#{TITLE};"

subtitle_tag = "#SUBTITLE"
file_headers << "#{subtitle_tag}:#{SUBTITLE};"

artist_tag="#ARTIST"
file_headers << "#{artist_tag}:#{ARTIST}:"

titletranslit_tag="#TITLETRANSLIT"
file_headers << "#{titletranslit_tag}:#{TITLETRANSLIT};"

subtitletranslit_tag="#SUBTITLETRANSLIT"
file_headers << "#{subtitletranslit_tag}:#{SUBTITLETRANSLIT};"

artist_tag="#ARTISTTRANSLIT"
file_headers << "#{artist_tag}:#{ARTIST};"

credit_tag="#CREDIT"
file_headers << "#{credit_tag}:#{CREDIT};"

banner_tag="#BANNER"
file_headers << "#{banner_tag}:#{BANNER};"

background_tag="#BACKGROUND"
file_headers << "#{background_tag}:#{BACKGROUND};"

lyricspath_tag="#LYRICSPATH"
file_headers << "#{lyricspath_tag}:#{LYRICSPATH};"

cdtitle_tag="#CDTITLE"
file_headers << "#{cdtitle_tag}:#{CDTITLE};"

music_tag="#MUSIC"
file_headers << "#{music_tag}:#{MUSIC};"

offset_tag="#OFFSET"
file_headers << "#{offset_tag}:#{OFFSET};"

samplestart_tag="#SAMPLESTART"
file_headers << "#{samplestart_tag}:#{SAMPLESTART};"

samplelength_tag="#SAMPLELENGTH"
file_headers << "#{samplelength_tag}:#{SAMPLELENGTH};"

selectable_tag="#SELECTABLE"
file_headers << "#{selectable_tag}:#{SELECTABLE};"

displaybpm_tag="#DISPLAYBPM"
file_headers << "#{displaybpm_tag}:#{BPM};"

bpms_tag="#BPMS"
file_headers << "#{bpms_tag}:#{BPM};"

stops_tag="#STOPS"
file_headers << "#{stops_tag}:#{STOPS};"

bgchanges_tag="#BGCHANGES"
file_headers << "#{bgchanges_tag}:#{BGCHANGES};"
notes_tag="#NOTES"



gamemode_tag="dance-single"
difficulty_data << "#{notes_tag}:"
difficulty_data << "\t#{gamemode_tag}:"
#TODO
difficulty_data << "\t#{DIFFICULTY_NAME}:"
difficulty_data << "\t#{DIFFICULTY_NAME}:"
difficulty_data << "\t#{DIFFICULTY}:"
difficulty_data << "\t#{RADAR}:"

def gen_measure(divisor)
  measure = Array.new
  (1..divisor).each do |div|
    measure << "1000"
  end
  measure
end 

def gen_measures(num, divisor)
  measures = Array.new
  (1..num).each do |measure_num|
    measures << gen_measure(divisor)
    if num != measure_num
      measures << ","
    else
      measures << ";"
    end
  end
  measures
end

file = Array.new
file << file_headers
file << difficulty_data
file << gen_measures(MEASURES.to_i, DIVISOR.to_i)
file = file.flatten

File.open(filename, "w+") do |f|
  f.puts(file)
end

