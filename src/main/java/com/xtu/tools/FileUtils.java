package com.xtu.tools;

import java.io.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/** 文件处理工具类
 * Created by Ilovezilian on 2017/4/19.
 */
public class FileUtils {
    /**
     * 解压zip文件
     * @param file
     * @return
     */
    public static String unzipFile(File file) {
        String res = null;
        try {
            ZipInputStream zis = new ZipInputStream(new FileInputStream(file));
            for (ZipEntry ze = zis.getNextEntry(); null != ze; ze = zis.getNextEntry()) {
                OUT.prt("ZipEntryname", ze.getName());
                OUT.prt("content", new String(ze.getExtra()));
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return res;
    }

    /**
     * 解压输入流zip文件
     * @param is
     * @return
     */
    public static String unzipFile(InputStream is) {
        String res = null;
        int size = 0;
        try (ZipInputStream zis = new ZipInputStream(is)) {
            for (ZipEntry ze = zis.getNextEntry(); null != ze; ze = zis.getNextEntry()) {
                OUT.prt("ZipEntryname", ze.getName());
                if (ze.isDirectory()) {
                    continue;
                }
                size = (int) ze.getSize();
                byte[] tmpByte = new byte[size];
                OUT.prt("size", size);
                if (size < 0) {
                    continue;
                }
                zis.read(tmpByte, 0, size);
                // TODO: 2017/4/20 add bufferReader
                OUT.prt("content", new String(tmpByte));
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return res;
    }
}
