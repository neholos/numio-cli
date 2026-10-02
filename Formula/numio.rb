class Numio < Formula
  desc "Command-line tool for time calculations"
  homepage "https://github.com/neholos/numio-cli"
  url "https://github.com/neholos/numio-cli/releases/download/v1.0.0/numio-cli-1.0.0-macOS.zip"
  sha256 "5ef6083204e4dc2ab77f367ca78f4d296d4a599420d6f4fc85b433a89e2ce76e"

  depends_on :macos

  def install
    bin.install "numio"
  end

  test do
    assert_equal "14:45\n", shell_output("#{bin}/numio 12:30 + 02:15")
  end
end
