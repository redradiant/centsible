require 'asin'

module ASIN
  def create_signed_query_string(params)
    # nice tutorial http://cloudcarpenters.com/blog/amazon_products_api_request_signing/
    params[:Service] = :AWSECommerceService
    params[:AWSAccessKeyId] = @options[:key]
    params[:ResponseGroup] = 'OfferFull,Images,ItemAttributes'
    # utc timestamp needed for signing
    params[:Timestamp] = Time.now.utc.strftime('%Y-%m-%dT%H:%M:%SZ')

    query = params.map{|key, value| "#{key}=#{CGI.escape(value.to_s)}" }.sort.join('&')

    request_to_sign = "GET\n#{@options[:host]}\n#{@options[:path]}\n#{query}"
    hmac = OpenSSL::HMAC.digest(@options[:digest], @options[:secret], request_to_sign)

    signature = CGI.escape(Base64.encode64(hmac).chomp)
    "#{query}&Signature=#{signature}"
  end
end
