package org.sisgri.people

import org.codehaus.groovy.grails.commons.ApplicationHolder
import grails.transaction.Transactional

@Transactional
class PhotoService {
    
    def path = "/opt/sisgri/photos"

    def upload(Person personInstance, def photo) {
        if (!photo) {
            return
        }

    	new File(this.path).mkdirs()
        def photoPath = this.path + '/' + personInstance.id + '.jpg'

        if (!photo.empty) {
            photo.transferTo(new File(photoPath))
            return
        }
        return
    }

    def getPhoto(long id) {
        def photoPath = this.path + '/' + id + '.jpg'
        def photo = new File(photoPath)

        if(!photo.length()) {
            photo = ApplicationHolder.application.parentContext.getResource("images/no_photo.gif").getFile()
        }

        byte[] file = new byte[(int) photo.length()]
        FileInputStream fileInputStream=null

        try {
            //convert file into array of bytes
            fileInputStream = new FileInputStream(photo)
            fileInputStream.read(file)
            fileInputStream.close()
        }catch(Exception e){
            e.printStackTrace()
        }

        return file
    }

    def delete(long id) {
    	def photoPath = this.path + '/' + id + '.jpg'
    	def photo = new File(photoPath)

    	if(!photo.length())
    		photo.delete()
    }
}
