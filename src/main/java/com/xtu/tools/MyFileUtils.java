package com.xtu.tools;

import com.xtu.DB.entity.TestdatasEntity;

import java.io.*;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

/**
 * 文件处理工具类
 * Created by Ilovezilian on 2017/4/19.
 */
public class MyFileUtils {
    /**
     * 解压zip文件
     *
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
     *
     * @param is
     * @return
     */
    public static String unzipFile(InputStream is) {
        String res = null;
        int size = 0;
        try (ZipInputStream zis = new ZipInputStream(new BufferedInputStream(is))) {
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
        } finally {
            try {
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return res;
    }

    public static File zipFile(List<TestdatasEntity> entityList) {
        String fileName = entityList.get(0).getProblemId() + "_myFiles.zip";
        File file = new File(fileName);
        if (file.exists() && file.isFile()) {
            file.deleteOnExit();
        }

        try (FileOutputStream dest = new
                FileOutputStream(fileName);
             ZipOutputStream out = new ZipOutputStream(new BufferedOutputStream(dest))) {
            for (TestdatasEntity entity : entityList) {
                ZipEntry entryOut = new ZipEntry(entity.getNo() + ".out");
                OUT.prt("out file", entity.getNo() + ".out");
                out.putNextEntry(entryOut);
                out.write(entity.getOutput());
                ZipEntry entryIn = new ZipEntry(entity.getNo() + ".in");
                out.putNextEntry(entryIn);
                out.write(entity.getInput());
                OUT.prt("in file", entity.getNo() + ".in");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return file;
    }

    public static byte[] readFileToByteArray(File file) {
        try {
            FileInputStream fis = new FileInputStream(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}
