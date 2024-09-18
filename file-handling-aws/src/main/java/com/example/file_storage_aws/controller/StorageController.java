package com.example.file_storage_aws.controller;
import com.example.file_storage_aws.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
        import org.springframework.web.multipart.MultipartFile;
import java.util.List;

@Controller
public class StorageController {

    @Autowired
    private StorageService s3Service;

    @GetMapping("/")
    public String index(Model model) {
        List<String> files = s3Service.listAllFiles();
        model.addAttribute("files", files);
        return "fileupload"; // Return the JSP page name without .jsp
    }

    @PostMapping("/upload")
    public String upload(@RequestParam("file") MultipartFile file, Model model) {
        s3Service.saveFile(file);
        return "redirect:/"; // Redirect back to the index after upload
    }

    @GetMapping("/download/{filename}")
    @ResponseBody
    public ResponseEntity<byte[]> download(@PathVariable("filename") String filename) {
        byte[] bytes = s3Service.downloadFile(filename);
        return ResponseEntity.ok()
                .header("Content-Disposition", "attachment; filename=" + filename)
                .body(bytes);
    }

    @GetMapping("/delete/{filename}")
    public String deleteFile(@PathVariable("filename") String filename) {
        s3Service.deleteFile(filename);
        return "redirect:/"; // Redirect back to the index after deletion
    }
}

