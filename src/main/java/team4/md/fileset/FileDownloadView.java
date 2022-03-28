package team4.md.fileset;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import lombok.extern.log4j.Log4j;

@Log4j
public class FileDownloadView extends AbstractView {
	public FileDownloadView() {
		setContentType("application/download;charset=utf-8");
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		File file = (File)model.get("downloadFile");
		
		response.setContentType(getContentType());
		response.setContentLength((int)file.length());
		String value = "attachment; filename="+java.net.URLEncoder.encode(file.getName(), "utf-8")+";";
		response.setHeader("Content-Disposition", value);
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream os = response.getOutputStream(); // 브라우저 노드스트림
		FileInputStream fis = null; // 서버에서 읽어서 브라우저에 쓰기위함 ( response는 쓰기 / 서버에서는 읽기 )
		
		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, os);
			os.flush();
		} catch(IOException ie) {
			log.info("#FileDownloadView 예외: "+ie);
		}finally {
			if(fis != null) fis.close();
			if(os != null) os.close();
		}
	}

}
