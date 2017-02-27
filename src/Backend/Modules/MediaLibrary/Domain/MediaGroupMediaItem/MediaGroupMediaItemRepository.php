<?php

namespace Backend\Modules\MediaLibrary\Domain\MediaGroupMediaItem;

use Doctrine\ORM\EntityRepository;

final class MediaGroupMediaItemRepository extends EntityRepository
{
    /**
     * Get all MediaGroupMediaItem and their MediaItem
     *
     * @param array $mediaGroupIds
     * @param bool $onlyGetFirstMediaItem
     * @return array
     */
    public function getAll(
        array $mediaGroupIds,
        bool $onlyGetFirstMediaItem
    ) {
        $queryBuilder = $this->createQueryBuilder('i')
            ->select(array(
                'i',
                'mi',
                'g'
            ))
            ->join('i.item', 'mi')
            ->join('i.group', 'g')
            ->where('i.group = g
                AND g.id IN (:groupIds)
                AND i.item = mi
            ')
            ->setParameter('groupIds', $mediaGroupIds)
        ;

        if ($onlyGetFirstMediaItem) {
            $queryBuilder->andWhere('i.sequence = :sequence');
            $queryBuilder->setParameter('sequence', 1);
        }

        return $queryBuilder->getQuery()->getResult();
    }
}
