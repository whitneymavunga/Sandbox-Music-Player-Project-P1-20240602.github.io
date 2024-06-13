def set_video_tags(video, filepath):
    try:
        tags = ID3(filepath, v2_version=3)
    except ID3NoHeaderError:
        tags = ID3()

    tags.add(TXXX(3, desc='desc:custom_tag',text= video.custom_text))
    tags.save(filepath, v2_version=3)
