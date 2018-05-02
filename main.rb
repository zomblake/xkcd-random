require "json"
require "open-uri"

#find the highest number available
#use http://xkcd.com/info.0.json
maxNum = JSON.parse(open('https://xkcd.com/info.0.json').read)['num']


#generate a random number between one and max
randNum = rand(1...maxNum)


#add random number to base xkcd link to set image link variable
imageURL = JSON.parse(open("https://xkcd.com/" + randNum.to_s + "/info.0.json").read)['img']


#get file name of image to be saved/shown
imageName = uriPathTail = File.basename(URI.parse(imageURL).path)


#retrive image file using link
open('comics/' + imageName, 'wb') do |file|
  file << open(imageURL).read
end


#display image using feh
exec( 'feh ./comics/' + imageName)
