atom_feed do |feed|
  feed.title "My own blog title"
  feed.updated @atoms.first.created_at

  @atoms.each do |ttt|
    feed.entry ttt, {created_at: ttt.created_at, updated: ttt.updated_at} do |entry|
      entry.title ttt.title
      entry.content ttt.body
      entry.url atom_url(ttt)
      entry.summary ttt.body[0..100]
    end
  end
end
