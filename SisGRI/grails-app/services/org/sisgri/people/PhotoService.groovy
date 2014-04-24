package org.sisgri.people

import grails.transaction.Transactional

@Transactional
class PhotoService {

    def upload(Person personInstance, def photo) {
    	new File('fotos').mkdirs()
        def photoPath = 'fotos/'+personInstance.id+'.jpg'
        
        if (!photo.empty) {
            photo.transferTo(new File(photoPath))
            return
        }
        return
    }

    def delete(Person personInstance) {
    	def photoPath = 'fotos/'+personInstance.id+'.jpg'
    	def file = new File(photoPath)
    	
    	if(file != null)
    		file.delete()
    }
}
