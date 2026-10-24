class Ru < Formula
  desc "Update Python and JavaScript dependencies"
  homepage "https://github.com/rvben/ru"
  url "https://github.com/rvben/ru/archive/refs/tags/v0.1.99.tar.gz"
  version "0.1.99"
  sha256 "b7183d24b2c4bb4057149d95dde3f51c91ae5872972ebe6f13c951195790c241"
  license "MIT"

  depends_on "go" => :build

  def install
    pyver = File.read("go.mod")[%r{github\.com/rvben/pyver (v\S+)}, 1]
    odie "Review or remove the pyver startup patch for #{pyver}" if pyver != "v0.1.0"
    system "go", "mod", "vendor"
    # pyver v0.1.0 eagerly requires a build-machine Python helper even though
    # its default Go-native parser does not use it. Avoid that startup panic.
    inreplace "vendor/github.com/rvben/pyver/pyver.go", "func init() {\n",
              "func init() {\n\tif UseGoNative { return }\n"
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=v#{version}"),
           "-mod=vendor", "./cmd/ru"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ru version")
    assert_match "Usage:", shell_output("#{bin}/ru help")
    (testpath/"a").mkpath
    (testpath/"b").mkpath
    (testpath/"a/requirements.txt").write "requests==2.31.0\n"
    (testpath/"b/requirements.txt").write "requests==2.32.0\n"
    system bin/"ru", "align"
    assert_match "requests==2.32.0", (testpath/"a/requirements.txt").read
  end
end
