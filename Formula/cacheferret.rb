class Cacheferret < Formula
  desc "Find and safely clean developer caches across macOS and Linux"
  homepage "https://github.com/rvben/cacheferret"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.0/cacheferret-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "df76ed39aae833917f77f9dafde4bc9037602a0b600849263cf711b9ccf31efb"
    end

    on_intel do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.0/cacheferret-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "ca4141c2eef1d54da8db70a98a16e6c0bb1bde9bde995e5b9da8042ad56779c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.0/cacheferret-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "371dda12c448eb0b7d3e2d697a3aa52f5ba6af729c1ed31a1144a8d7f878a911"
    end

    on_intel do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.0/cacheferret-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77f3495eb1448bee2c44194fb9f69c1e89d6f5f79c53b750da66853768253891"
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
