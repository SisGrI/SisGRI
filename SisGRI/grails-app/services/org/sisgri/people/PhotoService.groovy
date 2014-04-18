package org.sisgri.people

import grails.transaction.Transactional

@Transactional
class PhotoService {

    def upload(Person personInstance, def photo) {
    	new File('/home/jefferson/SisGRI/fotos').mkdirs()
        def photoPath = '/home/jefferson/SisGRI/fotos/'+personInstance.id+'.jpg'
        
        if (!photo.empty) {
            photo.transferTo(new File(photoPath))
            return
        }
        return
    }
}
