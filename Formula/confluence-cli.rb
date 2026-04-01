class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.8/confluence-cli-v0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "bf1c1d40ba7b871ab8dc506d8d91c6ef3fb7781f9157f331d67468214533a262"
    else
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.8/confluence-cli-v0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "2cd1056c61eac62f49cde788eb695edd7a29618134620454aa53c69f726aa478"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.8/confluence-cli-v0.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8fc2641ce909317b43fad1e3b43fa120d4c719d669932b72761cd97fcaba07d"
    else
      odie "Linux ARM is not supported by this formula."
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
