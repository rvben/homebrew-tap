class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.5.1/unifi-cli-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "321cd28cfbf1d17316caac551fdc35ef4075a5b932400bbfea2d1c8c35ddfd97"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.5.1/unifi-cli-v0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "498b6d78af9589d5e02fb153169f618140cb32033427472f9981216d51d147b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.5.1/unifi-cli-v0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6aea5ae21ae48545825e85c7362570c2c0c730cd553c910f09864757ef146f0a"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.5.1/unifi-cli-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "31d08c1c8797b328276bce8106983b1e78b09b98b1348c4aa49031d57bac7f1a"
    end
  end

  def install
    bin.install "unifi", "unifi-cli"
    generate_completions_from_executable(bin/"unifi", "completions")
  end

  test do
    %w[unifi unifi-cli].each do |command|
      assert_match version.to_s, shell_output("#{bin}/#{command} --version")
      system "#{bin}/#{command}", "--help"
    end
  end
end
