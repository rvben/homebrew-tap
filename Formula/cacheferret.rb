class Cacheferret < Formula
  desc "Find and safely clean developer caches across macOS and Linux"
  homepage "https://github.com/rvben/cacheferret"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.1/cacheferret-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "90de37b86efa0a8318004d76f792c64bc7e0195b97ba4a52b132b044f0839ca2"
    end

    on_intel do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.1/cacheferret-v0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "7891fe5973928a8845dc3fa2be3c8c8bcdd94043ae90950d6163161e506a79bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.1/cacheferret-v0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "48f1974f89882a136845d6f54d4fa5d3d7fd85db58043f5ed03ba272c69d68e3"
    end

    on_intel do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.1/cacheferret-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "04bed0735227de513ae3ed49d63d6a9efd30baf1431abfec648c1eb43e209d22"
    end
  end

  def install
    bin.install "cacheferret"
    bash_completion.install "completions/cacheferret.bash" => "cacheferret"
    zsh_completion.install "completions/_cacheferret"
    fish_completion.install "completions/cacheferret.fish"
  end

  test do
    assert_match "\"clispec\": \"0.3\"", shell_output("#{bin}/cacheferret schema")
  end
end
