module Socialite
  def socialite(options)
    size     = options[:size]
    url      = options[:url]
    title    = options[:title]
    networks = options[:networks] || :all

    unless url.present? && title.present?
      RAILS_DEFAULT_LOGGER.warn "Socialite requires a URL and title!"
    else
      links = {
        :delicious   => "http://www.delicious.com/post?url=#{url}&title=#{title}",
        :digg        => "http://www.digg.com/submit?url=#{url}&title=#{title}",
        :facebook    => "http://www.facebook.com/share.php?u=#{url}",
        :reddit      => "http://www.reddit.com/submit?url=#{url}&title=#{title}",
        :stumbleupon => "http://www.stumbleupon.com/submit?url=#{url}&title=#{title}",
        :technorati  => "http://www.technorati.com/faves?add=#{url}&title=#{title}",
        :twitter     => "http://www.twitter.com/?status=#{title}: #{url}",
        :email       => "mailto:?subject=#{title}&body=#{title}: #{url}"
      }.with_indifferent_access
      
      networks = links.keys if links == :all
      
      networks.map do |network|
        submit_url = links[network]
        basename   = [network, size].select(&:present?).join('_')
        "<a href='#{submit_url}'><img src='/images/socialite/#{basename}.png' alt='#{network}'></a>"
      end
    end
  end
end
