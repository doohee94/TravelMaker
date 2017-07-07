package tm.admin.dto;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

public class QRUtil {

	public static void makeQR(String url, String file_name) {
		try {
			File file = null;

			file = new File("C:\\TravelMaker\\TravelMaker\\WebContent\\upload\\admin\\stempqr\\");
			if (!file.exists()) {
				file.mkdirs();
			}
			QRCodeWriter writer = new QRCodeWriter();
			url = new String(url.getBytes("UTF-8"), "ISO-8859-1");
			BitMatrix matrix = writer.encode(url, BarcodeFormat.QR_CODE, 300, 300);
			// QR코드 색상
			int qrColor = 0x00000000;
			MatrixToImageConfig config = new MatrixToImageConfig(qrColor, 0xFFFFFFFF);
			BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(matrix, config);
			ImageIO.write(qrImage, "png", new File("C:\\TravelMaker\\TravelMaker\\WebContent\\upload\\admin\\stempqr\\" + file_name + ".png"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
